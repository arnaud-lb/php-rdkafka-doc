<?php

$conf = new RdKafka\Conf();
$conf->set('metadata.broker.list', '127.0.0.1:9093');

$producer = new RdKafka\Producer($conf);

$topic = $producer->newTopic("test");

while (true) {
    $topic->produce(0, 0, date(DATE_W3C));
    $topic->produce(1, 0, date(DATE_W3C));
    $topic->produce(2, 0, date(DATE_W3C));
    sleep(1);
}

