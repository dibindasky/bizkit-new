class SocketEndpoints {
  // ----------------------------------------------------------------------------
  // common modules
  static const notification = '';

  // ----------------------------------------------------------------------------
  // Task Module

  // [ Local base url for chat  ]
  // static const taskChat =
  //     'wss://9jdcxxr1-8000.inc1.devtunnels.ms/ws/task/{task_id}/';
  // static const messageCount =
  //     'wss://9jdcxxr1-8000.inc1.devtunnels.ms/ws/messages/';

  // [ AWS base url for chat  ]
  static const taskChat = 'ws://13.53.126.162/ws/task/{task_id}/';
  static const messageCount = 'ws://13.53.126.162/ws/messages/';
}
