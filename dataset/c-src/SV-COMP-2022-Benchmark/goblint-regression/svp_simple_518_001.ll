; ModuleID = 'svp_simple_518_001.c'
source_filename = "svp_simple_518_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@myglobal = common global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [20 x i8] c"myglobal equals %dn\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_518_001_isr_1(i8* %0) #0 !dbg !12 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %3, metadata !18, metadata !DIExpression()), !dbg !19
  %4 = load i32, i32* @myglobal, align 4, !dbg !20
  %5 = add nsw i32 %4, 1, !dbg !21
  store i32 %5, i32* %3, align 4, !dbg !19
  %6 = load i32, i32* %3, align 4, !dbg !22
  store i32 %6, i32* @myglobal, align 4, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @add1(i32 %0) #0 !dbg !25 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !28, metadata !DIExpression()), !dbg !29
  %3 = load i32, i32* %2, align 4, !dbg !30
  %4 = add nsw i32 %3, 1, !dbg !31
  ret i32 %4, !dbg !32
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_518_001_main() #0 !dbg !33 {
  %1 = load i32, i32* @myglobal, align 4, !dbg !36
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i32 %1), !dbg !37
  %3 = load i32, i32* @myglobal, align 4, !dbg !38
  %4 = call i32 @add1(i32 %3), !dbg !39
  ret i32 0, !dbg !40
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "myglobal", scope: !2, file: !3, line: 2, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_518_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!4 = !{}
!5 = !{!0}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{!"clang version 10.0.0 "}
!12 = distinct !DISubprogram(name: "svp_simple_518_001_isr_1", scope: !3, file: !3, line: 7, type: !13, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DILocalVariable(name: "arg", arg: 1, scope: !12, file: !3, line: 7, type: !15)
!17 = !DILocation(line: 7, column: 37, scope: !12)
!18 = !DILocalVariable(name: "tmp", scope: !12, file: !3, line: 8, type: !6)
!19 = !DILocation(line: 8, column: 7, scope: !12)
!20 = !DILocation(line: 8, column: 13, scope: !12)
!21 = !DILocation(line: 8, column: 21, scope: !12)
!22 = !DILocation(line: 9, column: 14, scope: !12)
!23 = !DILocation(line: 9, column: 12, scope: !12)
!24 = !DILocation(line: 12, column: 1, scope: !12)
!25 = distinct !DISubprogram(name: "add1", scope: !3, file: !3, line: 14, type: !26, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{!6, !6}
!28 = !DILocalVariable(name: "x", arg: 1, scope: !25, file: !3, line: 14, type: !6)
!29 = !DILocation(line: 14, column: 15, scope: !25)
!30 = !DILocation(line: 15, column: 10, scope: !25)
!31 = !DILocation(line: 15, column: 11, scope: !25)
!32 = !DILocation(line: 15, column: 3, scope: !25)
!33 = distinct !DISubprogram(name: "svp_simple_518_001_main", scope: !3, file: !3, line: 18, type: !34, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!34 = !DISubroutineType(types: !35)
!35 = !{!6}
!36 = !DILocation(line: 19, column: 32, scope: !33)
!37 = !DILocation(line: 19, column: 3, scope: !33)
!38 = !DILocation(line: 21, column: 8, scope: !33)
!39 = !DILocation(line: 21, column: 3, scope: !33)
!40 = !DILocation(line: 23, column: 3, scope: !33)
