<?php

$conf = new RdKafka\Conf();

// $conf->set('debug', 'all');

// Configure the group.id. All consumer with the same group.id will consume
// different partitions.
$conf->set('group.id', 'myConsumerGroup');

// Initial list of Kafka brokers
$conf->set('metadata.broker.list', '127.0.0.1:9093');

// Emit EOF event when reaching the end of a partition
$conf->set('enable.partition.eof', 'true');

$conf->setRebalanceCb(function ($rk, $err, $partitions) {
    var_dump(rd_kafka_err2str($err), $partitions);
    switch ($err) {
        case RD_KAFKA_RESP_ERR__ASSIGN_PARTITIONS:
            $rk->assign($partitions);
            break;
        case RD_KAFKA_RESP_ERR__REVOKE_PARTITIONS:
            $rk->assign(null);
            break;
        case RD_KAFKA_RESP_ERR_REBALANCE_IN_PROGRESS:
            var_dump("RD_KAFKA_RESP_ERR_REBALANCE_IN_PROGRESS");
            break;
    }
});

$consumer = new RdKafka\KafkaConsumer($conf);

$consumer->subscribe(['test']);

while (true) {
    $message = $consumer->consume(3600e3);
    switch ($message->err) {
        case RD_KAFKA_RESP_ERR_NO_ERROR:
            var_dump($message);
            break;
        case RD_KAFKA_RESP_ERR__PARTITION_EOF:
            echo "No more messages; will wait for more\n";
            break;
        case RD_KAFKA_RESP_ERR__TIMED_OUT:
            echo "Timedout\n";
            break;
        default:
            throw new \Exception($message->errstr(), $message->err);
            break;
    }
}

