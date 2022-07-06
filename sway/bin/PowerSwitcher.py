import sys

from PyQt5.QtCore import *
from PyQt5.QtWidgets import *


# Subclass QMainWindow to customize your application's main window
class PowerSwitcher(QMainWindow):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Power Switcher")

        button1 = QPushButton("Battery Saver")
        button2 = QPushButton("Balanced")
        button3 = QPushButton("Performance")

        self.setFixedSize(QSize(400, 300))

        layout = QVBoxLayout()
        
        layout.addWidget(button1)
        layout.addWidget(button2)
        layout.addWidget(button3)

        widget = QWidget()
        widget.setLayout(layout)
        self.setCentralWidget(widget)


app = QApplication(sys.argv)

window = PowerSwitcher()
window.show()

app.exec()