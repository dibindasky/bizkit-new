class SocketEndpoints {
  // ----------------------------------------------------------------------------
  // common modules
  static const notification = '';

  // ----------------------------------------------------------------------------
  // Task Module

  // [ Local base url for chat  ]
  static const taskChat =
      'wss://9jdcxxr1-8001.inc1.devtunnels.ms/ws/task/{task_id}/';
  static const messageCount =
      'wss://9jdcxxr1-8001.inc1.devtunnels.ms/ws/messages/tasks/';
  static const bizcardNotification =
      'wss://9jdcxxr1-8001.inc1.devtunnels.ms/ws/messages/bizcards/';

  // ----------------------------------------------------------------------------
  // [ AWS base url for chat  ]
  // static const taskChat = 'ws://3.7.66.232/ws/task/{task_id}/';
  // static const messageCount = 'ws://3.7.66.232/ws/messages/tasks/';
  // static const bizcardNotification = 'ws://3.7.66.232/ws/messages/bizcards/';

  // ----------------------------------------------------------------------------
  // [ beta launch AWS base url for chat  ]
  // static const taskChat = 'ws://13.232.28.52/ws/task/{task_id}/';
  // static const messageCount = 'ws://13.232.28.52/ws/messages/tasks/';
  // static const bizcardNotification = 'ws://13.232.28.52/ws/messages/bizcards/';
}
