# 🚀 Rost MQL5 Indicators Collection

[![MQL5](https://img.shields.io/badge/MQL5-Expert%20Advisor-blue.svg)](https://www.mql5.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0-blue.svg)](https://github.com/NeoZorK/Rost_MQL5_Indicators)
[![Last Updated](https://img.shields.io/badge/Last%20Updated-2025-blue.svg)](https://github.com/NeoZorK/Rost_MQL5_Indicators)

> **Professional MQL5 Indicators Collection for MetaTrader 5**  
> Advanced trading indicators with multiple trading rules and signal systems

---



## 📋 Table of Contents

- [Support the Project](#-support-the-project)
- [About](#about)
- [Features](#features)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Indicators Overview](#indicators-overview)
- [Empire Indicators](#empire-indicators)
- [SCHR Core Indicators](#schr-core-indicators)
- [Trend Indicators](#trend-indicators)
- [Volatility Indicators](#volatility-indicators)
- [Wave & Momentum Indicators](#wave--momentum-indicators)
- [Dependencies](#dependencies)
- [Usage Examples](#usage-examples)
- [Contributing](#contributing)
- [License](#license)
- [Contacts](#contacts)

## 🎯 About

This repository contains a comprehensive collection of professional MQL5 indicators developed by **NeoZorK** (Rostyslav Shcherbyna). These indicators are designed for advanced trading strategies with multiple trading rules, signal systems, and volatility analysis.

### Key Features
- **Multiple Trading Rules**: 6 different trading signal types (BUY, SELL, DBL_BUY, DBL_SELL, BUY_AND_SELL, NOTRADE)
- **Open Price Focus**: Optimized for open price calculations
- **Advanced Signal Filtering**: Built-in trend detection and signal validation
- **Professional Trading Logic**: Based on years of trading experience
- **Customizable Parameters**: Extensive input parameters for fine-tuning

## ⚡ Features

- 🔄 **Multi-Rule Trading System**: 6 comprehensive trading signal types
- 📊 **Advanced Technical Analysis**: RSI, ADX, KAMA, Parabolic SAR, and more
- 🎨 **Visual Signal Display**: Color-coded signals and trend lines
- ⚡ **Performance Optimized**: Efficient calculations with minimal redraw
- 🔧 **Highly Configurable**: Extensive parameter customization
- 📱 **Alert System**: Built-in notifications and push alerts
- 🌊 **Wave Analysis**: Advanced wave pattern recognition
- 📈 **Trend Detection**: Multiple trend identification algorithms

## 🚀 Installation

### Prerequisites
- MetaTrader 5 (MT5)
- MQL5 Editor
- Access to MQL5 Market (for some components)

### Step-by-Step Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/NeoZorK/Rost_MQL5_Indicators.git
   ```

2. **Copy to MT5 Data Folder**
   - Navigate to your MT5 Data Folder
   - Copy the `MQL5` folder to your MT5 installation
   - Or copy individual `.mq5` files to `MQL5/Indicators/`

3. **Install Dependencies**
   - Install [RExperts](https://github.com/NeoZorK/RExperts) for expert advisors
   - Install [RInclude](https://github.com/NeoZorK/RInclude) for include files

4. **Compile Indicators**
   - Open MQL5 Editor in MT5
   - Compile all `.mq5` files
   - Restart MT5 if needed

## 🚀 Quick Start

### Basic Usage

1. **Add Indicator to Chart**
   - Right-click on chart → "Indicators List"
   - Select desired indicator from the list
   - Configure parameters and click "OK"

2. **Recommended Settings**
   - **Timeframe**: M5, M15, H1 (depending on indicator)
   - **Period**: 2-10 (default values work well)
   - **Volatility**: 1-5 (adjust based on market conditions)

3. **Signal Interpretation**
   - **Blue**: BUY signals
   - **Yellow/Red**: SELL signals
   - **Aqua**: DBL_BUY signals
   - **Red**: DBL_SELL signals
   - **Gray**: No trade zone

### Example Configuration

```mql5
// SCHR_CORE.mq5 Example
input ushort inp_StrengthBack = 2;        // Strength Back
input ENUM_TR_SWITCH inp_TR_Num = CORE1;  // Trading Rule
input bool inp_Reverse_Signal = false;    // Reverse Signal
```

## 📊 Indicators Overview

### Core Indicators
- **SCHR_CORE.mq5** - Main RSI-based indicator with dynamic levels
- **SCHR_CORE2.mq5** - Enhanced CORE with additional features
- **SCHR_CORE22.mq5** - Advanced CORE with extended functionality
- **SCHR_CORE3.mq5** - Latest CORE version with optimizations

### Trend Indicators
- **SCHR_Trend.mq5** - Comprehensive trend helper with 10 trading rules
- **SCHR_LongTrend.mq5** - Long-term trend analysis
- **SCHR_ShortTrend.mq5** - Short-term trend detection (4 variants)
- **SCHR_MultyTrend.mq5** - Multi-timeframe trend analysis

### Volatility Indicators
- **SCHR_VolD.mq5** - Volatility-based directional signals
- **SCHR_VolDCross.mq5** - Volatility crossover signals
- **SCHR_VolDTop.mq5** - Volatility top/bottom detection
- **RVolatility.mq5** - General volatility measurement

### Wave & Momentum
- **SCHR_Wave.mq5** - Advanced wave pattern recognition
- **SCHR_Wave2.mq5** - Enhanced wave analysis
- **SCHR_MOM.mq5** - Momentum oscillator
- **SCHR_PRESSURE.mq5** - Market pressure analysis

## 🏛️ Empire Indicators

The Empire collection provides specialized indicators for advanced trading strategies:

### Core Empire
- **Empire.mq5** - Multi-pass parabolic averages with RSI
- **EmpireCORE.mq5** - RSI-based reverse detection system
- **EmpireCORE2.mq5** - Enhanced CORE with trend lines
- **EmpireCORE22.mq5** - Advanced CORE with level analysis
- **EmpireCORE3.mq5** - Latest CORE with optimizations

### Specialized Empire
- **Empire_ADX.mq5** - ADX-based trend strength
- **Empire_KAMA.mq5** - Kaufman Adaptive Moving Average
- **Empire_QQ.mq5** - Quick response indicator
- **Empire_ZLHA.mq5** - Zero-lag high accuracy
- **Empire_EDist.mq5** - Euclidean distance analysis

### Empire Volatility
- **EmpireVol.mq5** - Volatility analysis system
- **EmpireVol2.mq5** - Enhanced volatility detection
- **EmpVolDTop.mq5** - Volatility top detection
- **EmpireQuality.mq5** - Signal quality assessment

### Empire Trend
- **EmpireTrendOscillator.mq5** - Trend oscillator
- **EmpireLiner.mq5** - Linear trend analysis
- **EmpireStep.mq5** - Step-by-step trend detection
- **EmpireTDF.mq5** - Trend direction filter

### Empire Support
- **EmpireBorder.mq5** - Support/resistance borders
- **EmpirePCI.mq5** - Price channel indicator
- **EmpireBands.mq5** - Dynamic bands system

## 🔧 SCHR Core Indicators

### Main CORE System
- **SCHR_CORE.mq5** - Primary RSI-based indicator
  - Dynamic RSI levels (10, 30, 70, 90)
  - 3 trading rule modes (Plus, ABS_Plus, CORE1)
  - Reverse signal capability
  - Color-coded signals (Gray, Blue, Gold)

### Advanced CORE
- **SCHR_CORE2.mq5** - Enhanced CORE with extended features
- **SCHR_CORE22.mq5** - Advanced CORE with level analysis
- **SCHR_CORE3.mq5** - Latest CORE with optimizations

## 📈 Trend Indicators

### Primary Trend
- **SCHR_Trend.mq5** - Main trend helper
  - 10 different trading rules
  - Extreme point detection (5-95)
  - Purchase power analysis
  - Alert and push notifications

### Trend Variants
- **SCHR_LongTrend.mq5** - Long-term trend analysis
- **SCHR_ShortTrend.mq5** - Short-term trend (4 variants)
- **SCHR_MultyTrend.mq5** - Multi-timeframe analysis
- **SCHR_MAFIB_Trend.mq5** - MA + Fibonacci trend
- **SCHR_MAFIBDir_Trend.mq5** - MA + Fibonacci directional

### Specialized Trend
- **SCHR_DIR.mq5** - Directional trend analysis
- **SCHR_DDAV.mq5** - Dynamic average trend
- **SCHR_DFIB.mq5** - Dynamic Fibonacci trend
- **SCHR_PHL.mq5** - Price level trend helper

## 🌊 Wave & Momentum

### Wave Analysis
- **SCHR_Wave.mq5** - Advanced wave pattern recognition
  - Global prime zone filtering
  - Global reverse zone detection
  - Signal zone optimization
  - Tick-based calculation

- **SCHR_Wave2.mq5** - Enhanced wave analysis
  - Improved signal filtering
  - Advanced trend detection
  - Performance optimizations

### Momentum & Pressure
- **SCHR_MOM.mq5** - Momentum oscillator
- **SCHR_PRESSURE.mq5** - Market pressure analysis
- **SCHR_True.mq5** - True strength indicator
- **SCHR_Rost.mq5** - Rost-specific analysis

## 📊 Volatility Indicators

### Volatility Direction
- **SCHR_VolD.mq5** - Volatility directional signals
  - ATR-based volatility measurement
  - LWMA averaging
  - Color-coded signals (Blue/Red)

### Volatility Analysis
- **SCHR_VolDCross.mq5** - Volatility crossover detection
- **SCHR_VolDTop.mq5** - Volatility top/bottom analysis
- **SCHR_Volya.mq5** - Volatility strength measurement

## 🔗 Dependencies

### Required Repositories

- **[RExperts](https://github.com/NeoZorK/RExperts)** - Expert Advisor framework
- **[RInclude](https://github.com/NeoZorK/RInclude)** - Include files and utilities

### Include Files Used
- `RInclude\ROnOpenPrice.mqh` - New bar detection
- `RInclude\RNotify.mqh` - Notification system
- `RInclude\RMath.mqh` - Mathematical utilities

## 💡 Usage Examples

### Basic Trend Analysis
```mql5
// Add SCHR_Trend to chart
// Set period = 2, TR = TR_Zone
// Use extreme points: UP=95, DOWN=5
// Enable alerts and push notifications
```

### Volatility Trading
```mql5
// Add SCHR_VolD to chart
// Set volatility = 1-5
// Set average = 1-2
// Look for crossover signals
```

### Wave Pattern Recognition
```mql5
// Add SCHR_Wave to chart
// Configure global prime zones
// Set signal filtering parameters
// Monitor trend reversals
```

## 🤝 Contributing

We welcome contributions! Please feel free to submit issues, feature requests, or pull requests.

### Contribution Guidelines
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2025 NeoZorK (Rostyslav Shcherbyna)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 💰 Support the Project

If you find these indicators helpful and would like to support the development, consider making a donation:

### Bitcoin (BTC)
**Wallet Address**: `bc1qm0ynz8tk2em3zr8agv5j3550vpm420z3hxdfkq`

[![Bitcoin](https://img.shields.io/badge/Bitcoin-Donate-orange.svg?style=flat&logo=bitcoin)](bitcoin:bc1qm0ynz8tk2em3zr8agv5j3550vpm420z3hxdfkq)

> 💡 **QR Code**: Scan the QR code below or copy the wallet address above to send your donation.

<div align="center">

![Bitcoin QR Code](https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=bc1qm0ynz8tk2em3zr8agv5j3550vpm420z3hxdfkq)

</div>

### Why Support?
- 🚀 **Continuous Development**: Help fund new features and improvements
- 🐛 **Bug Fixes**: Support faster bug resolution and updates
- 📚 **Documentation**: Better documentation and tutorials
- 💡 **New Indicators**: Development of additional trading tools
- 🌟 **Community**: Help grow the MQL5 trading community

---

## 📞 Contacts

**Author**: Shcherbyna Rostyslav  
**Email**:   
**Documentation Version**: 1.0  
**Last Updated**: 2025  

**About Me**: [LinkedIn Profile](https://www.linkedin.com/in/rostyslav-sh-) - Professional trader and MQL5 developer with extensive experience in algorithmic trading and technical analysis.

---

> ⚠️ **Warning**: Trading on financial markets involves high risks. Use these experts at your own risk.

---

<div align="center">

**Made with ❤️ by [NeoZorK](https://github.com/NeoZorK)**

[![GitHub](https://img.shields.io/badge/GitHub-NeoZorK-black.svg?style=flat&logo=github)](https://github.com/NeoZorK)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Rostyslav%20Shcherbyna-blue.svg?style=flat&logo=linkedin)](https://www.linkedin.com/in/rostyslav-sh-)
[![Email](https://img.shields.io/badge/Email-NeoZorK%40protonmail.com-red.svg?style=flat&logo=protonmail)](mailto:)

</div>
