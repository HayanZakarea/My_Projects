import React, { useEffect, useState } from "react";
import "./ManageUsers.css";
import AdminMenu from "../../components/AdminMenu/AdminMenu";
import { getUsers, updateUserStatus, deleteUser } from "../../api/adminApi";

function ManageUsers() {
  const [users, setUsers] = useState([]);

  const fetchUsers = () => {
    getUsers()
      .then((res) => setUsers(res.data))
      .catch((err) => {
        console.error(err);
        alert("Failed to fetch users");
      });
  };

  useEffect(() => {
    fetchUsers();
  }, []);

  const handleBlock = async (userId) => {
    try {
      await updateUserStatus(userId, "block");
      alert("User blocked successfully");
      fetchUsers();
    } catch (error) {
      console.error(error);
      alert("Failed to block user");
    }
  };

  const handleUnblock = async (userId) => {
    try {
      await updateUserStatus(userId, "activate");
      alert("User activated successfully");
      fetchUsers();
    } catch (error) {
      console.error(error);
      alert("Failed to activate user");
    }
  };

  const handleDelete = async (userId) => {
    const confirmDelete = window.confirm(
      "Are you sure you want to delete this user?"
    );

    if (!confirmDelete) return;

    try {
      await deleteUser(userId);
      alert("User deleted successfully");
      fetchUsers();
    } catch (error) {
      console.error(error);
      alert("Failed to delete user");
    }
  };

  return (
    <div className="manage-users-container">
      <AdminMenu />

      <h1>Manage Users</h1>

      <table className="users-table">
        <thead>
          <tr>
            <th>#</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Type</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead>

        <tbody>
          {Array.isArray(users) &&
            users.map((user, idx) => (
              <tr key={user.id}>
                <td>{idx + 1}</td>
                <td>{user.name}</td>
                <td>{user.email}</td>
                <td>{user.phone}</td>
                <td>{user.type}</td>
                <td>{user.status}</td>
                <td>
                  {user.status === "blocked" ? (
                    <button
                      onClick={() => handleUnblock(user.id)}
                      className="unblock-btn"
                    >
                      Unblock
                    </button>
                  ) : (
                    <button
                      onClick={() => handleBlock(user.id)}
                      className="block-btn"
                    >
                      Block
                    </button>
                  )}

                  &nbsp;

                  <button
                    onClick={() => handleDelete(user.id)}
                    className="delete-btn"
                  >
                    Delete
                  </button>
                </td>
              </tr>
            ))}
        </tbody>
      </table>
    </div>
  );
}

export default ManageUsers;