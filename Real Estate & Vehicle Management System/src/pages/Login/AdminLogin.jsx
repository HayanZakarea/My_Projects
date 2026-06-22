import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import "./LoginStyles.css";
import { login } from "../../api/adminApi";

function AdminLogin() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const navigate = useNavigate();

  const handleLogin = async (e) => {
    e.preventDefault();

    try {
      const response = await login(email, password);

      const token = response.data.token;

      if (token) {
        localStorage.setItem("adminAuth", token);
        navigate("/dashboard");
      } else {
        alert("Login failed: No token returned.");
      }
    } catch (error) {
      console.error(error);
      alert("Login failed. Check your credentials.");
    }
  };

  return (
    <div className="login-page">
      <div className="overlay" />

      <form className="login-form" onSubmit={handleLogin}>
        <h2>Login</h2>

        <div className="input-group">
          <i className="fa fa-envelope" />

          <input
            type="email"
            placeholder="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
        </div>

        <div className="input-group">
          <i className="fa fa-lock" />

          <input
            type="password"
            placeholder="******"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
        </div>

        <button type="submit" className="login-button">
          Login
        </button>
      </form>
    </div>
  );
}

export default AdminLogin;