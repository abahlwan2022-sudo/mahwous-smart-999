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

# تعريف المنفذ الافتراضي (لأغراض التوثيق والتشغيل المحلي)
ENV PORT=8501

# كشف المنفذ
EXPOSE 8501

# استخدام ملف entrypoint.sh لضمان معالجة المتغيرات بشكل صحيح
ENTRYPOINT ["/bin/sh", "/app/entrypoint.sh"]
