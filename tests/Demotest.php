<?php
use PHPUnit\Framework\TestCase;

class DemoTest extends TestCase
{
    public function testTrueIsTrue()
    {
        $this->assertTrue(true);
    }

    public function testIndexFileExists()
    {
        $this->assertFileExists(__DIR__ . '/../src/index.php');
    }
}
