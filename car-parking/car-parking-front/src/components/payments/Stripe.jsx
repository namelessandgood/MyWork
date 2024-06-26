import React, { useContext, useEffect, useState } from "react";
import { loadStripe } from "@stripe/stripe-js";
import { Elements } from "@stripe/react-stripe-js";
import CheckoutForm from "./CheckoutForm";
import axios from "axios";
import { BASE_URL } from "../../helpers/url";
import { AuthContext } from "../../helpers/authContext";
import { getConfig } from "../../helpers/config";

export default function Stripe({ amount, setAmount }) {
  const stripePromise = loadStripe("pk_test_wrog9S6A4SEoHNLFkV0OQg9s");
  const [clientSecret, setClientSecret] = useState("");
  const {accessToken} = useContext(AuthContext);

  useEffect(() => {
    const fetchClientSecret = async () => {
        try {
          const response = await axios.post(`${BASE_URL}/parking/pay`, { amount },
          getConfig(accessToken));
          setClientSecret(response.data.clientSecret);
        } catch (error) {
          console.log(error);
        }
    };
    fetchClientSecret();
  }, []);

  return (
    <>
      {stripePromise && clientSecret && (
        <Elements stripe={stripePromise} options={{ clientSecret }}>
          <CheckoutForm setAmount={setAmount}/>
        </Elements>
      )}
    </>
  );
}
