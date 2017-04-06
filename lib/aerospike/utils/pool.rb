# encoding: utf-8
# Copyright 2014-2017 Aerospike, Inc.
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

  private

  class Pool #:nodoc:

    attr_accessor :create_block, :cleanup_block

    def initialize(max_size = 256, &block)
      @create_block = block
      @cleanup_block = nil

      @pool = Queue.new
      @max_size = max_size
    end

    def offer(obj)
      if @pool.length < @max_size
        @pool << obj
      elsif @cleanup_block
        @cleanup_block.call(obj)
      end
    end
    alias_method :<<, :offer

    def poll(create_new=true)
      non_block = true
      @pool.pop(non_block)
    rescue
      @create_block.call() if @create_block && create_new
    end

    def empty?
      @pool.length == 0
    end

    def length
      @pool.length
    end
    alias_method :size, :length

    def inspect
      "#<Aerospike::Pool: size=#{size}>"
    end

  end

end
