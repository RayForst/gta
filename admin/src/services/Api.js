import axios from "axios";
import store from "./../store";

export default () => {
  const token = store.state.token;
  let config = {
    baseURL: 'http://localhost:6680/api/'
  };

  if (token) {
    config.headers = {
      'Authorization': token
    };
  }
  
  return axios.create(config);
};
