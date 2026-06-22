import React, { useEffect, useState } from "react";
import {
  getPropertyDetails,
  getVehicleDetails,
  getUsers,
  updatePropertyStatus,
  updateVehicleStatus,
  sendAlertToOwnerApi,
} from "../../api/adminApi";
import "./PropertyVehicleDetails.css";

function PropertyVehicleDetails({ type, id, onClose }) {
  const [details, setDetails] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [alertSending, setAlertSending] = useState(false);
  const [alertMessage, setAlertMessage] = useState("");
  const [ownerEmail, setOwnerEmail] = useState("");

  useEffect(() => {
    fetchDetails();
  }, [type, id]);

  const fetchDetails = () => {
    setLoading(true);
    setError(null);

    const request =
      type === "property" ? getPropertyDetails(id) : getVehicleDetails(id);

    request
      .then((res) => {
        setDetails(res.data);
        fetchOwnerDetails(res.data.owner_id);
        setLoading(false);
      })
      .catch((err) => {
        console.error(err);
        setError("Failed to load details");
        setLoading(false);
      });
  };

  const fetchOwnerDetails = (ownerId) => {
    getUsers()
      .then((res) => {
        const owner = res.data.find((user) => user.id === ownerId);

        if (owner) {
          setOwnerEmail(owner.email);
        } else {
          setOwnerEmail("Unknown Owner");
        }
      })
      .catch((err) => {
        console.error(err);
        setOwnerEmail("Error loading owner");
      });
  };

  const handleAction = (action) => {
    const status = action === "approve" ? "active" : "inactive";

    const request =
      type === "property"
        ? updatePropertyStatus(id, status)
        : updateVehicleStatus(id, status);

    request
      .then((res) => {
        alert(
          res.data.message ||
            `${action === "approve" ? "Approved" : "Rejected"} successfully`
        );
        onClose();
      })
      .catch((err) => {
        console.error(err);
        alert(`Failed to ${action === "approve" ? "approve" : "reject"}`);
      });
  };

  const sendAlertToOwner = () => {
    const message = prompt(
      "Enter the alert message you want to send to the owner:"
    );

    if (!message) return;

    setAlertSending(true);
    setAlertMessage("");

    sendAlertToOwnerApi(type, id, message)
      .then((res) => {
        setAlertMessage(res.data.message || "Alert sent successfully");
        setAlertSending(false);
      })
      .catch((err) => {
        console.error(err);
        setAlertMessage("Failed to send alert");
        setAlertSending(false);
      });
  };

  if (loading) return <div className="details-modal">Loading...</div>;
  if (error) return <div className="details-modal">{error}</div>;
  if (!details) return <div className="details-modal">No data available</div>;

  return (
    <div className="details-modal-overlay" onClick={onClose}>
      <div className="details-modal" onClick={(e) => e.stopPropagation()}>
        <button className="close-button" onClick={onClose}>
          ×
        </button>

        <div className="title-with-alert">
          <h2>
            {type === "property" ? "Property Details" : "Vehicle Details"}
          </h2>

          <button
            className="alert-button"
            onClick={sendAlertToOwner}
            disabled={alertSending}
          >
            <i>🔔</i>
            {alertSending ? "Sending..." : "Send Alert"}
          </button>
        </div>

        {alertMessage && (
          <div
            className={`alert-feedback ${
              alertMessage.includes("Failed") ? "error" : "success"
            }`}
          >
            {alertMessage}
          </div>
        )}

        <div className="details-content">
          <div className="owner-info">
            <h3>Owner Information</h3>
            <div className="detail-item">
              <span className="label">Owner Email:</span>
              <span className="value">{ownerEmail}</span>
            </div>
          </div>

          <div className="image-gallery">
            {details.images && details.images.length > 0 ? (
              details.images.map((img, index) => (
                <img
                  key={index}
                  src={img}
                  alt={`${
                    type === "property" ? "Property" : "Vehicle"
                  } ${index + 1}`}
                />
              ))
            ) : (
              <div className="no-image">No images available</div>
            )}
          </div>

          {type === "property" && (
            <div className="property-details">
              <h3>{details.title}</h3>
              <p className="description">{details.description}</p>

              <div className="details-grid">
                <div className="detail-item">
                  <span className="label">Type:</span>
                  <span className="value">{details.type}</span>
                </div>

                <div className="detail-item">
                  <span className="label">City:</span>
                  <span className="value">{details.city}</span>
                </div>

                <div className="detail-item">
                  <span className="label">Address:</span>
                  <span className="value">{details.address}</span>
                </div>

                <div className="detail-item">
                  <span className="label">Price:</span>
                  <span className="value">${details.price} per night</span>
                </div>

                <div className="detail-item">
                  <span className="label">Description:</span>
                  <span className="value">{details.description}</span>
                </div>

                <div className="detail-item">
                  <span className="label">Status:</span>
                  <span className="value">{details.status}</span>
                </div>
              </div>
            </div>
          )}

          {type === "vehicle" && (
            <div className="vehicle-details">
              <h3>
                {details.brand} {details.model}
              </h3>

              <div className="details-grid">
                <div className="detail-item">
                  <span className="label">Brand:</span>
                  <span className="value">{details.brand}</span>
                </div>

                <div className="detail-item">
                  <span className="label">Model:</span>
                  <span className="value">{details.model}</span>
                </div>

                <div className="detail-item">
                  <span className="label">Year:</span>
                  <span className="value">{details.year}</span>
                </div>

                <div className="detail-item">
                  <span className="label">Price:</span>
                  <span className="value">${details.price} per day</span>
                </div>

                <div className="detail-item">
                  <span className="label">City:</span>
                  <span className="value">{details.city}</span>
                </div>

                <div className="detail-item">
                  <span className="label">Status:</span>
                  <span className="value">{details.status}</span>
                </div>
              </div>
            </div>
          )}
        </div>

        <div className="modal-actions">
          <button className="approve" onClick={() => handleAction("approve")}>
            Approve
          </button>

          <button className="reject" onClick={() => handleAction("reject")}>
            Reject
          </button>
        </div>
      </div>
    </div>
  );
}

export default PropertyVehicleDetails;