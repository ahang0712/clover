; ModuleID = 'example_simple_project/src/main.c'
source_filename = "example_simple_project/src/main.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@.str = private unnamed_addr constant [4 x i8] c"Sum\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"Difference\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"Product\00", align 1
@.str.3 = private unnamed_addr constant [40 x i8] c"All calculations completed successfully\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !8 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !12, metadata !DIExpression()), !dbg !13
  store i32 10, i32* %2, align 4, !dbg !13
  call void @llvm.dbg.declare(metadata i32* %3, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 5, i32* %3, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %4, metadata !16, metadata !DIExpression()), !dbg !17
  %7 = load i32, i32* %2, align 4, !dbg !18
  %8 = load i32, i32* %3, align 4, !dbg !19
  %9 = call i32 @add(i32 %7, i32 %8), !dbg !20
  store i32 %9, i32* %4, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %5, metadata !21, metadata !DIExpression()), !dbg !22
  %10 = load i32, i32* %2, align 4, !dbg !23
  %11 = load i32, i32* %3, align 4, !dbg !24
  %12 = call i32 @subtract(i32 %10, i32 %11), !dbg !25
  store i32 %12, i32* %5, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %6, metadata !26, metadata !DIExpression()), !dbg !27
  %13 = load i32, i32* %2, align 4, !dbg !28
  %14 = load i32, i32* %3, align 4, !dbg !29
  %15 = call i32 @multiply(i32 %13, i32 %14), !dbg !30
  store i32 %15, i32* %6, align 4, !dbg !27
  %16 = load i32, i32* %4, align 4, !dbg !31
  call void @print_result(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %16), !dbg !32
  %17 = load i32, i32* %5, align 4, !dbg !33
  call void @print_result(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 %17), !dbg !34
  %18 = load i32, i32* %6, align 4, !dbg !35
  call void @print_result(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i32 %18), !dbg !36
  call void @log_message(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.3, i64 0, i64 0)), !dbg !37
  ret i32 0, !dbg !38
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @add(i32, i32) #2

declare i32 @subtract(i32, i32) #2

declare i32 @multiply(i32, i32) #2

declare void @print_result(i8*, i32) #2

declare void @log_message(i8*) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "example_simple_project/src/main.c", directory: "/Users/hehang03/code/clover/tool/Control_flow_Analyzer")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{!"clang version 10.0.0 "}
!8 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 11, type: !9, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{!11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "a", scope: !8, file: !1, line: 13, type: !11)
!13 = !DILocation(line: 13, column: 9, scope: !8)
!14 = !DILocalVariable(name: "b", scope: !8, file: !1, line: 14, type: !11)
!15 = !DILocation(line: 14, column: 9, scope: !8)
!16 = !DILocalVariable(name: "sum", scope: !8, file: !1, line: 17, type: !11)
!17 = !DILocation(line: 17, column: 9, scope: !8)
!18 = !DILocation(line: 17, column: 19, scope: !8)
!19 = !DILocation(line: 17, column: 22, scope: !8)
!20 = !DILocation(line: 17, column: 15, scope: !8)
!21 = !DILocalVariable(name: "diff", scope: !8, file: !1, line: 18, type: !11)
!22 = !DILocation(line: 18, column: 9, scope: !8)
!23 = !DILocation(line: 18, column: 25, scope: !8)
!24 = !DILocation(line: 18, column: 28, scope: !8)
!25 = !DILocation(line: 18, column: 16, scope: !8)
!26 = !DILocalVariable(name: "prod", scope: !8, file: !1, line: 19, type: !11)
!27 = !DILocation(line: 19, column: 9, scope: !8)
!28 = !DILocation(line: 19, column: 25, scope: !8)
!29 = !DILocation(line: 19, column: 28, scope: !8)
!30 = !DILocation(line: 19, column: 16, scope: !8)
!31 = !DILocation(line: 22, column: 25, scope: !8)
!32 = !DILocation(line: 22, column: 5, scope: !8)
!33 = !DILocation(line: 23, column: 32, scope: !8)
!34 = !DILocation(line: 23, column: 5, scope: !8)
!35 = !DILocation(line: 24, column: 29, scope: !8)
!36 = !DILocation(line: 24, column: 5, scope: !8)
!37 = !DILocation(line: 27, column: 5, scope: !8)
!38 = !DILocation(line: 29, column: 5, scope: !8)
