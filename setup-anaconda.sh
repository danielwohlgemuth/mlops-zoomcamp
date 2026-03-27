#!/usr/bin/env bash
set -e

# Install Anaconda
PACKAGE="Anaconda3-2025.12-2-Linux-x86_64.sh"
if [[ ${OSTYPE} == 'darwin'* ]]; then
    PACKAGE="Anaconda3-2025.12-2-MacOSX-arm64.sh"
fi

wget https://repo.anaconda.com/archive/${PACKAGE}
# -b           run install in batch mode (without manual intervention),
#              it is expected the license terms (if any) are agreed upon
chmod u+x ${PACKAGE}
./${PACKAGE} -b
rm ${PACKAGE}

# Add Anaconda executable folder to PATH env var
if [ -f ${HOME}/.bashrc ]; then
    echo 'export PATH="'${HOME}'/anaconda3/bin:${PATH}"' >> ${HOME}/.bashrc
    source ${HOME}/.bashrc
fi
if [ -f ${HOME}/.zshrc ]; then
    echo 'export PATH="'${HOME}'/anaconda3/bin:${PATH}"' >> ${HOME}/.zshrc
    source ${HOME}/.zshrc
fi
