<div style="
  display: flex;
  gap: 20px;
  justify-content: center;
  font-family: 'Segoe UI', Arial;
">

  <!-- TARJETA TEMPERATURA -->
  <div style="
    width: 220px;
    background: linear-gradient(135deg, #ff6a00, #ffb347);
    color: white;
    border-radius: 16px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
  ">
    <h3 style="margin: 0;">🌡️ Temperatura</h3>
    <div id="temp" style="
      font-size: 48px;
      font-weight: bold;
      margin-top: 15px;
    ">-- °C</div>
  </div>

  <!-- TARJETA HUMEDAD -->
  <div style="
    width: 220px;
    background: linear-gradient(135deg, #00c6ff, #0072ff);
    color: white;
    border-radius: 16px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
  ">
    <h3 style="margin: 0;">Humedad</h3>
    <div id="hum" style="
      font-size: 48px;
      font-weight: bold;
      margin-top: 15px;
    ">-- %</div>
  </div>

</div>

<script>
  function refresh(data){
    document.getElementById("temp").innerHTML = data.field1 + " °C";
    document.getElementById("hum").innerHTML  = data.field2 + " %";
  }
</script>
