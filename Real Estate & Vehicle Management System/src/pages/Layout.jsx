import React from "react";
import { Outlet } from "react-router-dom";
import AdminMenu from ../../components/AdminMenu/AdminMenu";

function Layout() {
  return (
    <div>
      <AdminMenu />  
      <div className="page-content">
        <Outlet />   
      </div>
    </div>
  );
}

export default Layout;
