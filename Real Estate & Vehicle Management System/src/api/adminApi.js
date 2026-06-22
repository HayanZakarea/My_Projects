import axiosInstance from "./axiosInstance";

export const login = (email, password) =>
  axiosInstance.post("/api/login", {
    email,
    password,
  });


  export const getStatistics = () =>
  axiosInstance.get("/api/admin/Statistics");

export const getPendingVehicles = () =>
  axiosInstance.get("/api/admin/getPendingVehicles");

export const getPendingProperties = () =>
  axiosInstance.get("/api/admin/getPendingProperties");

export const getUsers = () =>
  axiosInstance.get("/api/admin/ListUsers");

export const updateUserStatus = (userId, action) =>
  axiosInstance.patch(`/api/admin/${userId}/status`, { action });

export const deleteUser = (userId) =>
  axiosInstance.delete(`/api/admin/deleteUser/${userId}`);

export const getPropertyDetails = (id) =>
  axiosInstance.get(`/api/admin/getProperty/${id}`);

export const getVehicleDetails = (id) =>
  axiosInstance.get(`/api/admin/getVehicle/${id}`);

export const updatePropertyStatus = (id, status) =>
  axiosInstance.patch(`/api/admin/PropretyStatus/${id}/status`, { status });

export const updateVehicleStatus = (id, status) =>
  axiosInstance.patch(`/api/admin/VehiclesStatus/${id}/status`, { status });

export const sendAlertToOwnerApi = (type, id, message) =>
  axiosInstance.post("/api/admin/alert-owner", {
    type,
    id,
    message,
  });

export const getMonthlyReport = (month) =>
  axiosInstance.get(`/api/admin/report?type=monthly&month=${month}`);
  