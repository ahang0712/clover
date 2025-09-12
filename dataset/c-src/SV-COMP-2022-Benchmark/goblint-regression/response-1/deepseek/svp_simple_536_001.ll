; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_536_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_536_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@data1 = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@data2 = internal global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_536_001_isr_1(i8* %arg) #0 !dbg !16 {
entry:
  %arg.addr = alloca i8*, align 8
  %tmp1 = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %tmp1, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i32, i32* @data1, align 4, !dbg !24
  %add = add nsw i32 %0, 1, !dbg !25
  store i32 %add, i32* %tmp1, align 4, !dbg !23
  %1 = load i32, i32* %tmp1, align 4, !dbg !26
  store i32 %1, i32* @data1, align 4, !dbg !27
  %2 = load i32, i32* @data2, align 4, !dbg !28
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %2), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_536_001_main() #0 !dbg !31 {
entry:
  %tmp = alloca i32, align 4
  %0 = load i32, i32* @data1, align 4, !dbg !34
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %0), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !36, metadata !DIExpression()), !dbg !37
  %1 = load i32, i32* @data2, align 4, !dbg !38
  %add = add nsw i32 %1, 1, !dbg !39
  store i32 %add, i32* %tmp, align 4, !dbg !37
  %2 = load i32, i32* %tmp, align 4, !dbg !40
  store i32 %2, i32* @data2, align 4, !dbg !41
  ret i32 0, !dbg !42
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "data1", scope: !2, file: !8, line: 3, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_536_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "data2", scope: !2, file: !8, line: 4, type: !9, isLocal: true, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_536_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{!"clang version 10.0.0 "}
!16 = distinct !DISubprogram(name: "svp_simple_536_001_isr_1", scope: !8, file: !8, line: 7, type: !17, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DILocalVariable(name: "arg", arg: 1, scope: !16, file: !8, line: 7, type: !19)
!21 = !DILocation(line: 7, column: 37, scope: !16)
!22 = !DILocalVariable(name: "tmp1", scope: !16, file: !8, line: 8, type: !9)
!23 = !DILocation(line: 8, column: 7, scope: !16)
!24 = !DILocation(line: 8, column: 14, scope: !16)
!25 = !DILocation(line: 8, column: 19, scope: !16)
!26 = !DILocation(line: 9, column: 11, scope: !16)
!27 = !DILocation(line: 9, column: 9, scope: !16)
!28 = !DILocation(line: 12, column: 15, scope: !16)
!29 = !DILocation(line: 12, column: 3, scope: !16)
!30 = !DILocation(line: 13, column: 1, scope: !16)
!31 = distinct !DISubprogram(name: "svp_simple_536_001_main", scope: !8, file: !8, line: 15, type: !32, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!32 = !DISubroutineType(types: !33)
!33 = !{!9}
!34 = !DILocation(line: 17, column: 15, scope: !31)
!35 = !DILocation(line: 17, column: 3, scope: !31)
!36 = !DILocalVariable(name: "tmp", scope: !31, file: !8, line: 18, type: !9)
!37 = !DILocation(line: 18, column: 7, scope: !31)
!38 = !DILocation(line: 18, column: 13, scope: !31)
!39 = !DILocation(line: 18, column: 18, scope: !31)
!40 = !DILocation(line: 19, column: 11, scope: !31)
!41 = !DILocation(line: 19, column: 9, scope: !31)
!42 = !DILocation(line: 22, column: 3, scope: !31)
