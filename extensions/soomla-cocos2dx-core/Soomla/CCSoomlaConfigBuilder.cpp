/*
 Copyright (C) 2012-2015 Soomla Inc.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#include "CCSoomlaConfigBuilder.h"
#include <string>

using namespace soomla;

CCSoomlaConfigBuilder::CCSoomlaConfigBuilder() {
    _rawConfig = new cocos2d::__Dictionary();
}

CCSoomlaConfigBuilder *CCSoomlaConfigBuilder::create() {
    return new CCSoomlaConfigBuilder();
}

bool CCSoomlaConfigBuilder::appendConfigParameter(const char *key, cocos2d::Ref *value) {
    _rawConfig->setObject(value, key);
    return true;
}

bool CCSoomlaConfigBuilder::appendConfigParameter(cocos2d::__Dictionary *value) {
    cocos2d::DictElement* pElement = NULL;
    using namespace cocos2d;
    CCDICT_FOREACH(value, pElement) {
        _rawConfig->setObject(pElement->getObject(), pElement->getStrKey());
    }
    return true;
}

cocos2d::__Dictionary *CCSoomlaConfigBuilder::build() {
    return this->_rawConfig;
}