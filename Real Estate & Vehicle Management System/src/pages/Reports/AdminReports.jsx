import React, { useEffect, useState } from "react";
import "./AdminReports.css";
import AdminMenu from "../../components/AdminMenu/AdminMenu";
import { getMonthlyReport } from "../../api/adminApi";

function AdminReports() {
  const [month, setMonth] = useState("2025-07");
  const [report, setReport] = useState(null);

  const fetchReport = async () => {
    try {
      const response = await getMonthlyReport(month);
      setReport(response.data);
    } catch (error) {
      console.error(error);
      alert("Failed to load report.");
    }
  };

  useEffect(() => {
    fetchReport();
  }, [month]);

  return (
    <>
      <AdminMenu />

      <div className="page-content report-container">
        <h1>Monthly Report</h1>

        <div className="filter-box">
          <label>Select Month:</label>
          <input
            type="month"
            value={month}
            onChange={(e) => setMonth(e.target.value)}
          />
        </div>

        {report && (
          <div className="report-grid">
            <div className="report-card">
              <h3>New Users</h3>
              <p>Owners: {report.new_users.owners}</p>
              <p>Renters: {report.new_users.renters}</p>
            </div>

            <div className="report-card">
              <h3>New Properties Ads</h3>
              <p>New: {report.ads.properties.new}</p>
              <p>Pending: {report.ads.properties.pending}</p>
              <p>Acceptance Rate: {report.ads.properties.acceptance_rate}%</p>
              <p>Rejection Rate: {report.ads.properties.rejection_rate}%</p>
            </div>

            <div className="report-card">
              <h3>New Vehicle Ads</h3>
              <p>New: {report.ads.vehicles.new}</p>
              <p>Pending: {report.ads.vehicles.pending}</p>
              <p>Acceptance Rate: {report.ads.vehicles.acceptance_rate}%</p>
              <p>Rejection Rate: {report.ads.vehicles.rejection_rate}%</p>
            </div>

            <div className="report-card">
              <h3>Archived Ads</h3>
              <p>{report.archived_ads}</p>
            </div>

            <div className="report-card">
              <h3>Inactive Ads</h3>
              <p>{report.inactive_ads}</p>
            </div>
          </div>
        )}
      </div>
    </>
  );
}

export default AdminReports;