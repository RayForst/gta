import axios from "axios";

export default () => {
  return axios.create({
    baseURL: 'http://localhost:6680/api/'
  });
};
