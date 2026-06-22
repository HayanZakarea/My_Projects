import React, { useEffect, useState } from "react";
import PropertyVehicleDetails from "../../components/PropertyVehicleDetails/PropertyVehicleDetails";
import AdminMenu from "../../components/AdminMenu/AdminMenu";
import { getPendingProperties } from "../../api/adminApi";
import "./PendingProperties.css";

function PendingProperties() {
  const [properties, setProperties] = useState([]);
  const [selectedItem, setSelectedItem] = useState(null);
  const [detailType, setDetailType] = useState("");

  useEffect(() => {
    fetchPendingProperties();
  }, []);

  const fetchPendingProperties = () => {
    getPendingProperties()
      .then((res) => setProperties(res.data))
      .catch((err) => console.error(err));
  };

  const handleCardClick = (property) => {
    setSelectedItem(property.id);
    setDetailType("property");
  };

  const handleCloseDetails = () => {
    setSelectedItem(null);
    setDetailType("");
  };

  return (
    <div className="pending-properties-page">
      <AdminMenu />

      <h1>Pending Properties</h1>

      {properties.length === 0 ? (
        <p className="no-properties">No pending properties.</p>
      ) : (
        <div className="properties-grid">
          {properties.map((property) => (
            <div
              key={property.id}
              className="property-card"
              onClick={() => handleCardClick(property)}
            >
              <img
                src={
                  property.images && property.images.length > 0
                    ? property.images[0]
                    : "/no-image.jpg"
                }
                alt={`${property.type} in ${property.city}`}
              />

              <h2>{property.type}</h2>

              <p>
                <strong>Location:</strong> {property.city}, {property.address}
              </p>

              <p>
                <strong>Price:</strong> ${property.price} per night
              </p>
            </div>
          ))}
        </div>
      )}

      {selectedItem && (
        <PropertyVehicleDetails
          type={detailType}
          id={selectedItem}
          onClose={handleCloseDetails}
        />
      )}
    </div>
  );
}

export default PendingProperties;