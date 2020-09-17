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

    $jml = count($data);
    for ($i = 0; $i <= $jml - 1; $i++) {
        $j = $i + 1;
        if ($data[$i] >= $data[$j]) {
            $j = $data[$j];
        } else {
            $temp = $data[$j];
            if ($data[$j] >= $temp) {
                $maksimal = $data[$j];
            } else {
                $maksimal = $temp;
            }
        }
    }

    echo 'Nilai terbesar adalah <b style=font-size:34px;>' . $maksimal . '</b>';
}

echo implode(",", bubbleSort(array(
    11,
    6, 31, 201, 99, 861, 1, 7, 14, 79
)));
