#!/bin/bash

# سكربت إعداد @AiPiBot على Termux بشكل آلي

echo "تهيئة Termux..."
echo "y" | termux-setup-storage
pkg update -y && pkg upgrade -y
pkg install python git nano libxml2 libxslt tmux -y
python -m ensurepip --upgrade
pip install --upgrade pip

# إنشاء مشروع AiPiBot
cd ~/
rm -rf AiPiBot || true
mkdir -p AiPiBot/utils AiPiBot/data
cd AiPiBot

# إنشاء ملف .env فارغ لإضافة التوكنات لاحقًا
touch .env

# إنشاء ملف requirements.txt
cat > requirements.txt << 'EOF'
python-telegram-bot==13.7
requests==2.28.1
transformers==4.30.2
langchain==0.0.300
newsapi-python==0.2.7
opencv-python==4.8.0
numpy==1.24.3
pandas==2.0.3
schedule==1.2.0
gitpython==3.1.32
EOF

# تحميل المتطلبات
pip install -r requirements.txt --no-cache-dir

echo "تم الإعداد بنجاح. أضف التوكنات في ملف .env ثم شغّل: python main.py"
