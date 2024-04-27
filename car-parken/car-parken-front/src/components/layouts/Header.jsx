import React from 'react'
import { Link } from 'react-router-dom'

const Header=()=> {
  return (
    <nav className="navbar navbar-expand-lg navbar-light bg-light">
    <Link className="navbar-brand" to="/"><i class="bi bi-p-square-fill h1"></i></Link>
    <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span className="navbar-toggler-icon"></span>
    </button>
  
    <div className="collapse navbar-collapse" id="navbarSupportedContent">
      <ul className="navbar-nav mr-auto">
        <li className="nav-item active">
          <Link className="nav-link" to="/">
          <i className="bi bi-house"></i>
            Home </Link>
        </li>
        <li className="nav-item">
          <Link className="nav-link" to="/register">
          <i className="bi bi-person-fill-add"></i>Register</Link>
        </li>
        <li className="nav-item">
          <Link className="nav-link" to="/login">
          <i className="bi bi-box-arrow-in-right"></i>Login</Link>
        </li>
       
      </ul>
      
    </div>
  </nav>
  )
}
export default Header;