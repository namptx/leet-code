<?php

class Solution {
    /**
     * @param String $s
     * @return Boolean
     */
    function isValid($s) {
        $stack = [];
        $open = ['(', '[', '{'];
        $close = [')', ']', '}'];
        $combine = array_combine($open, $close);
        $result = true;

        if (strlen($s) % 2 == 1)  {
            return false;
        }

        foreach (mb_str_split($s) as $c) {
            if (in_array($c, $open)) {
                array_push($stack, $c);
            }

            if (in_array($c, $close)) {
                $l = array_pop($stack);
                if ($c !== $combine[$l]) {
                    $result = false;
                    break;
                }
            }
        }
        
        if (!$result) {
            return false;
        }

        return !!empty($stack);
    }
}

$k = new Solution;
$test = '(';
echo $k->isValid($test) ? 'true' : 'false';