# Copyright 2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

require 'aws/model'
require 'aws/sns/subscription_collection'

module AWS
  class SNS

    # Represents the collection of all subscriptions for a particular
    # topic.  For example:
    #
    #  # get the e-mail addressess that receive plain-text
    #  # messages sent to the topic
    #  topic.subscriptions.
    #    select { |s| s.protocol == :email }.
    #    map(&:endpoint)
    class TopicSubscriptionCollection < SubscriptionCollection

      include Model
      include Enumerable

      # @return [Topic] The topic to which all the subscriptions
      # belong.
      attr_reader :topic

      # @private
      def initialize(topic, opts = {})
        @topic = topic
        super
      end

      # @private
      protected
      def list_request
        :list_subscriptions_by_topic
      end

      # @private
      protected
      def request_opts
        { :topic_arn => topic.arn }
      end

    end

  end
end
