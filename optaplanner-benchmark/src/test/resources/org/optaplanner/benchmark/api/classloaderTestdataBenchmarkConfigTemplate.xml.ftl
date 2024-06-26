<?xml version="1.0" encoding="UTF-8"?>
<!--
  ~ Licensed to the Apache Software Foundation (ASF) under one
  ~ or more contributor license agreements.  See the NOTICE file
  ~ distributed with this work for additional information
  ~ regarding copyright ownership.  The ASF licenses this file
  ~ to you under the Apache License, Version 2.0 (the
  ~ "License"); you may not use this file except in compliance
  ~ with the License.  You may obtain a copy of the License at
  ~
  ~   http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing,
  ~ software distributed under the License is distributed on an
  ~ "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  ~ KIND, either express or implied.  See the License for the
  ~ specific language governing permissions and limitations
  ~ under the License.
  -->
<plannerBenchmark>
  <benchmarkDirectory>target/benchmarkTest/output</benchmarkDirectory>
  <warmUpSecondsSpentLimit>0</warmUpSecondsSpentLimit>
<#list ['FIRST_FIT', 'CHEAPEST_INSERTION'] as constructionHeuristicType>
  <solverBenchmark>
    <problemBenchmarks>
      <solutionFileIOClass>org.optaplanner.persistence.common.api.domain.solution.RigidTestdataSolutionFileIO</solutionFileIOClass>
      <inputSolutionFile>target/test/benchmarkTest/input.xml</inputSolutionFile>
    </problemBenchmarks>
    <solver>
      <!-- Using these classnames doesn't work because the className still differs from class.getName()-->
      <!--<solutionClass>divertThroughClassLoader.org.optaplanner.core.impl.testdata.domain.TestdataSolution</solutionClass>-->
      <!--<entityClass>divertThroughClassLoader.org.optaplanner.core.impl.testdata.domain.TestdataEntity</entityClass>-->
      <solutionClass>org.optaplanner.core.impl.testdata.domain.TestdataSolution</solutionClass>
      <entityClass>org.optaplanner.core.impl.testdata.domain.TestdataEntity</entityClass>

      <!-- Score configuration -->
      <scoreDirectorFactory>
        <!-- Using these classnames doesn't work because the className still differs from class.getName()-->
        <!-- <constraintProviderClass>divertThroughClassLoader.org.optaplanner.core.impl.testdata.domain.TestdataConstraintProvider</constraintProviderClass>-->
        <constraintProviderClass>org.optaplanner.core.impl.testdata.domain.TestdataConstraintProvider</constraintProviderClass>
      </scoreDirectorFactory>
      <termination>
        <secondsSpentLimit>0</secondsSpentLimit>
      </termination>
      <constructionHeuristic>
        <constructionHeuristicType>${constructionHeuristicType}</constructionHeuristicType>
      </constructionHeuristic>
    </solver>
  </solverBenchmark>
</#list>
</plannerBenchmark>
