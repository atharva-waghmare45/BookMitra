import axios from 'axios'

const adminApi = axios.create({
  baseURL: 'http://localhost:4000/admin'
})

export default adminApi
