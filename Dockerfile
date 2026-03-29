FROM python:3.11-slim

WORKDIR /app

# تثبيت التبعيات الضرورية
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# نسخ ملفات المشروع
COPY . .

# جعل ملف التشغيل قابلاً للتنفيذ
RUN chmod +x entrypoint.sh

# تعريف المنفذ الافتراضي
ENV PORT=8501

# كشف المنفذ
EXPOSE 8501

# استخدام shell لتشغيل التطبيق لضمان استبدال متغيرات البيئة بشكل صحيح
CMD ["sh", "-c", "streamlit run app.py --server.port=${PORT} --server.address=0.0.0.0 --server.headless=true --server.enableCORS=false --server.enableXsrfProtection=false"]
