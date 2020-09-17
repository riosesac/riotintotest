<?php
function bubbleSort($data)
{
    $tukar = true;
    $n = count($data);
    $out = null;
    while ($tukar) {
        $tukar = false;
        for ($i = 0; $i < $n - 1; $i++) {
            if ($data[$i] > $data[$i + 1]) {
                $out = $data[$i];
                $data[$i] = $data[$i + 1];
                $data[$i + 1] = $out;
                $tukar = true;
            }
        }
    }

    return $data;
}

echo implode(",", bubbleSort(array(99, 2, 64, 8, 111, 33, 65, 11, 102, 50)));
