import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

import AdminLogin from './pages/Login/AdminLogin';
import Dashboard from './pages/Dashboard/Dashboard';
import ManageUsers from './pages/Users/ManageUsers';
import AdminReports from './pages/Reports/AdminReports';
import PendingVehicles from './pages/PendingVehicles/PendingVehicles';
import PendingProperties from './pages/PendingProperties/PendingProperties';

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<AdminLogin />} />
        <Route path="/login" element={<AdminLogin />} />
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/admin/users" element={<ManageUsers />} />
        <Route path="/admin/reports" element={<AdminReports />} />
        <Route path="/pending-vehicles" element={<PendingVehicles />} />
        <Route path="/pending-properties" element={<PendingProperties />} />
      </Routes>
    </Router>
  );
}

export default App;