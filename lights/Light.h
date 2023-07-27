/*
 * Copyright (C) 2018 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#pragma once

#include <aidl/android/hardware/light/BnLights.h>
#include <android-base/logging.h>
#include <hardware/hardware.h>
#include <hardware/lights.h>
#include <vector>

static unsigned int brightness_table_0x7ff[256] = {
    0,    15,   24,   37,   51,   73,   89,   113,  218,  299,  379,  444,
    484,  540,  580,  629,  669,  685,  725,  766,  790,  830,  854,  870,
    911,  935,  951,  991,  1015, 1040, 1056, 1080, 1096, 1120, 1136, 1160,
    1160, 1160, 1160, 1225, 1225, 1241, 1265, 1265, 1281, 1281, 1305, 1305,
    1322, 1322, 1346, 1346, 1362, 1362, 1386, 1386, 1402, 1402, 1426, 1426,
    1426, 1450, 1450, 1450, 1467, 1467, 1467, 1491, 1491, 1491, 1507, 1507,
    1507, 1531, 1531, 1531, 1531, 1547, 1547, 1547, 1547, 1571, 1571, 1587,
    1587, 1587, 1587, 1587, 1612, 1612, 1612, 1636, 1636, 1636, 1636, 1636,
    1652, 1652, 1652, 1652, 1652, 1676, 1676, 1676, 1676, 1676, 1692, 1692,
    1692, 1692, 1692, 1716, 1716, 1716, 1716, 1716, 1732, 1732, 1732, 1732,
    1732, 1732, 1732, 1732, 1757, 1757, 1757, 1757, 1773, 1773, 1773, 1773,
    1773, 1773, 1797, 1797, 1797, 1797, 1797, 1797, 1797, 1797, 1797, 1797,
    1813, 1813, 1813, 1813, 1813, 1813, 1813, 1837, 1837, 1837, 1837, 1837,
    1837, 1837, 1861, 1861, 1861, 1861, 1861, 1861, 1861, 1861, 1861, 1861,
    1877, 1877, 1877, 1877, 1877, 1877, 1877, 1877, 1877, 1902, 1902, 1902,
    1902, 1902, 1902, 1902, 1902, 1902, 1918, 1918, 1918, 1918, 1918, 1918,
    1918, 1918, 1918, 1918, 1942, 1942, 1942, 1942, 1942, 1942, 1942, 1942,
    1942, 1942, 1958, 1958, 1958, 1958, 1958, 1958, 1958, 1958, 1958, 1958,
    1958, 1958, 1982, 1982, 1982, 1982, 1982, 1982, 1982, 1982, 1982, 1982,
    1982, 1998, 1998, 1998, 1998, 1998, 1998, 1998, 1998, 1998, 1998, 1998,
    1998, 2022, 2022, 2022, 2022, 2022, 2022, 2022, 2022, 2022, 2022, 2022,
    2022, 2022, 2047, 2047
};

using ::aidl::android::hardware::light::HwLightState;
using ::aidl::android::hardware::light::HwLight;
using ::aidl::android::hardware::light::LightType;
using ::aidl::android::hardware::light::BnLights;

namespace aidl {
namespace android {
namespace hardware {
namespace light {

class Lights : public BnLights {
      ndk::ScopedAStatus setLightState(int id, const HwLightState& state) override;
      ndk::ScopedAStatus getLights(std::vector<HwLight>* types) override;
};

}  // namespace light
}  // namespace hardware
}  // namespace android
}  // namespace aidl
