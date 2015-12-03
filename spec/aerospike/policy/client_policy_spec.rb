# encoding: utf-8
# Copyright 2015 Aerospike, Inc.
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

require "spec_helper"

require "aerospike/policy/client_policy"

describe Aerospike::ClientPolicy do

  describe "#initialize" do

    it "should make a client policy with default values" do

      policy = described_class.new

      expect(policy.class).to eq described_class
      expect(policy.timeout).to eq 1.0
      expect(policy.connection_queue_size).to eq 64
      expect(policy.fail_if_not_connected).to be_true
      expect(policy.user).to be_nil
      expect(policy.password).to be_nil
    end

    it "should make a client policy with fail_if_not_connected set to false" do

      policy = described_class.new(fail_if_not_connected: false)

      expect(policy.fail_if_not_connected).to be_false
    end
  end

end
