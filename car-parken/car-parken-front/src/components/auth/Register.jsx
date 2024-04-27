import axios from 'axios';
import { React, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { url } from '../../helper/url';





export default function Register() {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState({});
  const navigate = useNavigate();
  const [loading, setLoading] = useState(false);
  const handleSubmit = async (e) => {
    e.preventDefault();
    setError({});
    setLoading(false);
    const data = { name, email, password };
    try {
      const response = await axios.post(`${url}/user/register`, data);
      localStorage.setItem('accessToken', response.data.access_token);
      setLoading(false);
      setError({});
      setName('');
      setEmail('');
      setPassword('');
      navigate('/');
    }
    catch (error) {
      setError(error.response.data);
      if (error.response.status === 422) {
        setError(error.response.data.errors);
      }
      console.log(error);
    }
  };


  return (
    <div className="container">
      <div className="row my-5">
        <div className="col-md-6 mx-auto">
          <div className="card">
            <div className="card-header bg-white p-3 text-center">
              <h4>
                Create an account
              </h4>
            </div>
            <div className="card-body">
              <form onSubmit={(e) => handleSubmit(e)}>
                <div className="row mb-4">
                  <div className="col">
                    <div className="form-group">
                      <input id = {0}type="text" name="name" value={name}
                        className='form-control mb-2 rounded-0'
                        onChange={(e) => setName(e.target.value)}
                        placeholder='name' />
                    </div>
                    <div className="form-group">
                      <input id={1} type="email" name="email" value={email}
                        className='form-control mb-2 rounded-0'
                        onChange={(e) => setEmail(e.target.value)}
                        placeholder='email' />
                    </div>
                    <div className="form-group">
                      <input id={2} type="password" name="password" value={password}
                        className='form-control mb-2 rounded-0'
                        onChange={(e) => setPassword(e.target.value)}
                        placeholder='password' min={8} max={255} />
                    </div>
                    <div>
                      <button className="btn btn-primary btn-sm rounded-0">Submit</button>
                    </div>

                  </div>

                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
};
