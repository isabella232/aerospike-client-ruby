# encoding: utf-8
# Copyright 2016-2020 Aerospike, Inc.
#
# Portions may be licensed to Aerospike, Inc. under one or more contributor
# license agreements.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.

module Aerospike
  module CDT
    module MapOrder

      ##
      # Map is not ordered. This is the default.
      UNORDERED = {attr: 0, flag: 0x40}

      ##
      # Order map by key.
      KEY_ORDERED = {attr: 1, flag: 0x80}

      ##
      # Order map by key, then value.
      KEY_VALUE_ORDERED = {attr: 3, flag: 0xc0}

      ##
      # Default order
      DEFAULT = UNORDERED
    end
  end
end
