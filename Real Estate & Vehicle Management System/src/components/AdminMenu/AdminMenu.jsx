import React from "react";
import { Link } from "react-router-dom";
import './AdminMenu.css';

function AdminMenu() {
  return (
    <nav className="admin-menu">
      <h2 className="logo">Admin Panel</h2>
      <div className="links">
        <Link to="/dashboard">Dashboard</Link>
        <Link to="/admin/users">Manage Users</Link>
        <Link to="/admin/reports">Reports</Link>
        <Link to="/pending-vehicles">Pending Vehicles</Link>
        <Link to="/pending-properties">Pending Properties</Link>

      </div>
    </nav>
  );
}

export default AdminMenu;
