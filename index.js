const express = require("express");
const axios = require("axios");
const moment = require("moment-timezone");
const { version } = require("./package.json");  // Dynamically import version from package.json

const app = express();
const PORT = 9574;
const API_KEY = process.env.API_KEY;
const CITY = process.env.CITY;

app.get('/api/hello', async (req, res) => {
  try {
    const response = await axios.get(`https://api.openweathermap.org/data/2.5/weather?q=${CITY}&appid=${API_KEY}&units=metric`);

    const weather = {
      temperature: response.data.main.temp.toString(),
      temp_unit: "c"
    };

    const datetime = moment().tz("Asia/Dhaka").format("YYMMDDHHmm");

    res.json({
      hostname: "Niaz",
      datetime: datetime,
      version: version,  
      weather: {
        dhaka: weather
      }
    });
  } catch (err) {
    console.error("Weather API error:", err.response?.data || err.message);
    res.status(500).json({ error: "Failed to fetch weather data" });
  }
});

app.get("/api/health", async (req, res) => {
  try {
    await axios.get(`https://api.openweathermap.org/data/2.5/weather?q=${CITY}&appid=${API_KEY}`);
    res.json({ status: "Healthy", weather_api: "Reachable" });
  } catch (err) {
    res.status(500).json({ status: "Unhealthy", weather_api: "Unreachable" });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
