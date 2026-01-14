import QtQuick
import QtQml
import QtPositioning
import QtLocation

Rectangle {
    id: root

    Plugin {
        // More information: https://doc.qt.io/qt-6/location-plugin-osm.html
        id: osmPlugin // Use the OpenStreetMap plugin
        name: "osm"

        // Cache directory: Specifies where the OSM plugin stores
        // downloaded map tiles. This improves performance by caching
        // tiles locally, reducing network requests and allowing offline
        // viewing of previously loaded map areas.
        PluginParameter {
            name: "osm.mapping.cache.directory"
            value: osmCacheDirectory
        }

        // By default, the OpenStreetMap plugin retrieves the provider's
        // information from a remote repository to avoid a loss of
        // service due to unavailability of hardcoded services. The
        // plugin, however, still contains fallback hardcoded provider
        // data, in case the provider repository becomes unreachable.
        // Setting this parameter to true makes the plugin use the
        // hardcoded urls only and therefore prevents the plugin from
        // fetching provider data from the remote
        // repository.
        PluginParameter {
            name: "osm.mapping.providersrepository.disabled"
            value: "true"
        }

        // Providers repository address: configuration setting in the
        // Qt Location Framework that lets developers specify the URL
        // for a repository of OpenStreetMap (OSM) map provider
        // information, allowing customization beyond the default.
        // Instead of relying on hardcoded or default servers (like
        // maps-redirect.qt.io)
        PluginParameter {
            name: "osm.mapping.providersrepository.address"
            value: "http://maps-redirect.qt.io/osm/5.6/"
        }
    }

    // MapView wraps a Map and adds the typical interactive features:
    // changing the zoom level, panning and tilting the map.
    MapView {
        id: view
        signal geocodeFinished // TBD
        onGeocodeFinished: {
            // TBD
        }

        anchors.fill: parent
        map {
            // center: QtPositioning.coordinate(59.9139, 10.7522) // Example: Oslo coordinates]
            center: QtPositioning.coordinate(37.7749, -122.4194) // San Francisco
            zoomLevel: 12.0 // 8.0 is the default zoom level
            plugin: osmPlugin
        }
    }

    GeocodeModel {
        id: geocodeModel
        plugin: view.map.plugin
        // Set a query to populate the model with locations
        // This performs forward geocoding (address to coordinates)
        query: "San Francisco, CA"
        autoUpdate: false // Set to true if you want automatic updates

        onStatusChanged: {
            if ((status == GeocodeModel.Ready) || (status == GeocodeModel.Error))
                view.geocodeFinished();
        }
        onLocationsChanged: {
            console.log("GeocodeModel found", count, "locations");
            if (count === 1) {
                view.map.center.latitude = get(0).coordinate.latitude;
                view.map.center.longitude = get(0).coordinate.longitude;
            }
        }

        // Update the model when component loads
        Component.onCompleted: {
            update();
        }
    }

    MapItemView {
        parent: view.map
        model: geocodeModel
        delegate: pointDelegate
    }

    Component {
        id: pointDelegate

        MapQuickItem {
            id: point
            parent: view.map
            // The data stored and returned in the GeocodeModel consists of
            // Location objects, as a list with the role name "locationData".
            // See the documentation for Location for further details on its
            // structure and contents.
            coordinate: locationData.coordinate

            sourceItem: Image {
                id: pointMarker
                source: "qrc:/images/locationMarker.svg"
                sourceSize.width: 24
                sourceSize.height: 24
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}
