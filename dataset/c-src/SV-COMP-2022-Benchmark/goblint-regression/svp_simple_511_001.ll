; ModuleID = 'svp_simple_511_001.c'
source_filename = "svp_simple_511_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@myglobal = common global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_511_001_isr_1(i8* %0) #0 !dbg !12 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !16, metadata !DIExpression()), !dbg !17
  %3 = call i32 (...) @lock(), !dbg !18
  %4 = load i32, i32* @myglobal, align 4, !dbg !19
  %5 = add nsw i32 %4, 1, !dbg !19
  store i32 %5, i32* @myglobal, align 4, !dbg !19
  %6 = call i32 (...) @unlock(), !dbg !20
  ret void, !dbg !21
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @lock(...) #2

declare i32 @unlock(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_511_001_main() #0 !dbg !22 {
  %1 = call i32 (...) @lock(), !dbg !25
  %2 = load i32, i32* @myglobal, align 4, !dbg !26
  %3 = add nsw i32 %2, 1, !dbg !26
  store i32 %3, i32* @myglobal, align 4, !dbg !26
  %4 = call i32 (...) @unlock(), !dbg !27
  ret i32 0, !dbg !28
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "myglobal", scope: !2, file: !3, line: 2, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_511_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!4 = !{}
!5 = !{!0}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{!"clang version 10.0.0 "}
!12 = distinct !DISubprogram(name: "svp_simple_511_001_isr_1", scope: !3, file: !3, line: 6, type: !13, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DILocalVariable(name: "arg", arg: 1, scope: !12, file: !3, line: 6, type: !15)
!17 = !DILocation(line: 6, column: 37, scope: !12)
!18 = !DILocation(line: 7, column: 3, scope: !12)
!19 = !DILocation(line: 8, column: 11, scope: !12)
!20 = !DILocation(line: 9, column: 3, scope: !12)
!21 = !DILocation(line: 11, column: 1, scope: !12)
!22 = distinct !DISubprogram(name: "svp_simple_511_001_main", scope: !3, file: !3, line: 14, type: !23, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{!6}
!25 = !DILocation(line: 17, column: 3, scope: !22)
!26 = !DILocation(line: 18, column: 11, scope: !22)
!27 = !DILocation(line: 19, column: 3, scope: !22)
!28 = !DILocation(line: 21, column: 3, scope: !22)
