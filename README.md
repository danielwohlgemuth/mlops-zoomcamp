# mlops-zoomcamp

## Setup

```bash
# Install Anaconda 
wget https://repo.anaconda.com/archive/Anaconda3-2025.12-2-Linux-x86_64.sh
# -b           run install in batch mode (without manual intervention),
#              it is expected the license terms (if any) are agreed upon
bash Anaconda3-2025.12-2-Linux-x86_64.sh -b
rm Anaconda3-2025.12-2-Linux-x86_64.sh

# Add Anaconda executable folder to PATH env var
echo 'export PATH="/home/codespace/anaconda3/bin:${PATH}"' >> ~/.bashrc
source ~/.bashrc

# Launch Jupyter Notebook
jupyter notebook
```