class SocketEndpoints {
  // ----------------------------------------------------------------------------
  // common modules
  static const notification = '';

  // ----------------------------------------------------------------------------
  // Task Module

  // [ Local base url for chat  ]
  // static const taskChat =
  //     'wss://9jdcxxr1-8001.inc1.devtunnels.ms/ws/task/{task_id}/';
  // static const messageCount =
  //     'wss://9jdcxxr1-8001.inc1.devtunnels.ms/ws/messages/';

  // ----------------------------------------------------------------------------
  // [ AWS base url for chat  ]
  static const taskChat = 'ws://51.20.44.77/ws/task/{task_id}/';
  static const messageCount = 'ws://51.20.44.77/ws/messages/';
}
