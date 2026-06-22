import React, { useEffect, useState } from "react";
import "./Dashboard.css";
import AdminMenu from "../../components/AdminMenu/AdminMenu";
import {
  getStatistics,
  getPendingVehicles,
  getPendingProperties,
} from "../../api/adminApi";

function Dashboard() {
  const [stats, setStats] = useState({
    users: {},
    properties: {},
    vehicles: {},
    bookings: {},
    pending_ads: 0,
    pending_properties: 0,
  });

  useEffect(() => {
    getStatistics()
      .then((res) => setStats((prev) => ({ ...prev, ...res.data })))
      .catch((err) => {
        console.error(err);
        alert("Failed to load dashboard stats.");
      });

    getPendingVehicles()
      .then((res) =>
        setStats((prev) => ({ ...prev, pending_ads: res.data.length }))
      )
      .catch((err) => {
        console.error(err);
        alert("Failed to load pending ads count.");
      });

    getPendingProperties()
      .then((res) =>
        setStats((prev) => ({ ...prev, pending_properties: res.data.length }))
      )
      .catch((err) => {
        console.error(err);
      });
  }, []);

  return (
    <div className="dashboard-container">
      <AdminMenu />

      <h1>Admin Dashboard</h1>

      <div className="stats-cards">
        <div className="card">
          <h2>{stats.users.total || 0}</h2>
          <p>Total Users</p>
        </div>

        <div className="card">
          <h2>{stats.users.owners || 0}</h2>
          <p>Owners</p>
        </div>

        <div className="card">
          <h2>{stats.users.renters || 0}</h2>
          <p>Renters</p>
        </div>

        <div className="card">
          <h2>{stats.users.blocked || 0}</h2>
          <p>Blocked Accounts</p>
        </div>

        <div className="card">
          <h2>{stats.properties.total || 0}</h2>
          <p>Total Properties</p>
        </div>

        <div className="card">
          <h2>{stats.properties.active || 0}</h2>
          <p>Active Properties</p>
        </div>

        <div className="card">
          <h2>{stats.properties.pending || 0}</h2>
          <p>Pending Properties</p>
        </div>

        <div className="card">
          <h2>{stats.properties.archived || 0}</h2>
          <p>Archived Properties</p>
        </div>

        <div className="card">
          <h2>{stats.vehicles.total || 0}</h2>
          <p>Total Vehicles</p>
        </div>

        <div className="card">
          <h2>{stats.vehicles.active || 0}</h2>
          <p>Active Vehicles</p>
        </div>

        <div className="card">
          <h2>{stats.vehicles.pending || 0}</h2>
          <p>Pending Vehicles</p>
        </div>

        <div className="card">
          <h2>{stats.vehicles.archived || 0}</h2>
          <p>Archived Vehicles</p>
        </div>

        <div className="card">
          <h2>{stats.bookings.total || 0}</h2>
          <p>Total Bookings</p>
        </div>

        <div className="card">
          <h2>{stats.bookings.today || 0}</h2>
          <p>Bookings Today</p>
        </div>

        <div className="card">
          <h2>{stats.pending_ads || 0}</h2>
          <p>Pending Ads (Vehicles)</p>
        </div>

        <div className="card">
          <h2>{stats.pending_properties || 0}</h2>
          <p>Pending Properties</p>
        </div>
      </div>
    </div>
  );
}

export default Dashboard;