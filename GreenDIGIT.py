from fastapi import FastAPI
import board
from adafruit_htu21d import HTU21D

app = FastAPI()

# Initialize the I2C bus and the sensor
i2c = board.I2C()
sensor = HTU21D(i2c)

# Updated the URL endpoint to match the module name
@app.get("/api/greendigit/data")
def read_sensor():
    try:
        temp = sensor.temperature
        hum = sensor.relative_humidity
        return {
            "module": "GreenDIGIT-sensor",
            "temperature": {
                "id": "greendigit/temperature",
                "state": f"{temp:.1f} °C",
                "value": round(temp, 2)
            },
            "humidity": {
                "id": "greendigit/humidity",
                "state": f"{hum:.1f} %",
                "value": round(hum, 2)
            }
        }
    except Exception as e:
        return {"error": str(e)}
