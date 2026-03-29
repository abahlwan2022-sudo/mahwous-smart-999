#!/bin/sh

# التأكد من وجود قيمة للمنفذ، وإذا لم تكن موجودة نستخدم 8501
PORT_VAL=${PORT:-8501}

echo "Starting Streamlit on port: $PORT_VAL"

# تشغيل streamlit باستخدام exec لضمان وصول الإشارات (signals) بشكل سليم
exec streamlit run app.py \
  --server.port=$PORT_VAL \
  --server.address=0.0.0.0 \
  --server.headless=true \
  --server.enableCORS=false \
  --server.enableXsrfProtection=false
