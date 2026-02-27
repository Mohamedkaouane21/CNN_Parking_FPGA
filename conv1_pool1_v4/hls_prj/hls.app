<AutoPilot:project xmlns:AutoPilot="com.autoesl.autopilot.project" top="conv1_pool1" name="hls_prj" ideType="classic" projectType="C/C++">
    <files>
        <file name="src/conv1_pool1.cpp" sc="0" tb="false" cflags="-Isrc" csimflags="" blackbox="false"/>
        <file name="../../src/tb_conv1_pool1.cpp" sc="0" tb="1" cflags="-I../../src -Wno-unknown-pragmas" csimflags="" blackbox="false"/>
    </files>
    <Simulation argv="">
        <SimFlow name="csim" setup="false" optimizeCompile="false" clean="true" ldflags="" mflags=""/>
    </Simulation>
    <solutions>
        <solution name="solution1" status=""/>
    </solutions>
</AutoPilot:project>

