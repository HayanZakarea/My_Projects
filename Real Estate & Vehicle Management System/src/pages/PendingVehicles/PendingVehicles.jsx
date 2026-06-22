import React, { useEffect, useState } from "react";
import PropertyVehicleDetails from "../../components/PropertyVehicleDetails/PropertyVehicleDetails";
import AdminMenu from "../../components/AdminMenu/AdminMenu";
import { getPendingVehicles } from "../../api/adminApi";
import "./PendingVehicles.css";

function PendingVehicles() {
  const [vehicles, setVehicles] = useState([]);
  const [selectedItem, setSelectedItem] = useState(null);
  const [detailType, setDetailType] = useState("");

  useEffect(() => {
    fetchPendingVehicles();
  }, []);

  const fetchPendingVehicles = () => {
    getPendingVehicles()
      .then((res) => setVehicles(res.data))
      .catch((err) => console.error(err));
  };

  const handleCardClick = (vehicle) => {
    setSelectedItem(vehicle.id);
    setDetailType("vehicle");
  };

  const handleCloseDetails = () => {
    setSelectedItem(null);
    setDetailType("");
  };

  return (
    <div className="pending-vehicles-page">
      <AdminMenu />

      <h1>Pending Vehicles</h1>

      {vehicles.length === 0 ? (
        <p className="no-vehicles">There are no vehicles pending.</p>
      ) : (
        <div className="vehicles-grid">
          {vehicles.map((vehicle) => (
            <div
              key={vehicle.id}
              className="vehicle-card"
              onClick={() => handleCardClick(vehicle)}
            >
              <img
                src={
                  vehicle.images && vehicle.images.length > 0
                    ? vehicle.images[0]
                    : "/no-image.jpg"
                }
                alt={`${vehicle.brand} ${vehicle.model}`}
              />

              <h2>
                {vehicle.brand} {vehicle.model}
              </h2>

              <p>
                <strong>Year:</strong> {vehicle.year}
              </p>

              <p>
                <strong>Price:</strong> ${vehicle.price} per day
              </p>

              <p>
                <strong>City:</strong> {vehicle.city}
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

export default PendingVehicles;