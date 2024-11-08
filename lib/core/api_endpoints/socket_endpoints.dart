class SocketEndpoints {
  // ----------------------------------------------------------------------------
  // common modules
  static const notification = '';

  // ----------------------------------------------------------------------------
  // Task Module

  // [ Local base url for chat  ]
  static const taskChat =
      'wss://9jdcxxr1-8000.inc1.devtunnels.ms/ws/task/{task_id}/';
  static const messageCount =
      'wss://9jdcxxr1-8000.inc1.devtunnels.ms/ws/messages/';

  // ----------------------------------------------------------------------------
  // [ AWS base url for chat  ]
  // static const taskChat = 'ws://16.171.15.184/ws/task/{task_id}/';
  // static const messageCount = 'ws://16.171.15.184/ws/messages/';
}
