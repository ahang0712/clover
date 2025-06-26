; ModuleID = 'svp_simple_668_001-opt.bc'
source_filename = "./svp_simple_668_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g1 = common global i32 0, align 4
@g2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_668_001_isr_1(i8* %0) #0 !dbg !7 {
  %2 = load i32, i32* @g1, align 4, !dbg !10, !tbaa !11
  %3 = call i32 (i32, ...) bitcast (i32 (...)* @access to i32 (i32, ...)*)(i32 %2), !dbg !15
  %4 = load i32, i32* @g2, align 4, !dbg !16, !tbaa !11
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @access to i32 (i32, ...)*)(i32 %4), !dbg !17
  ret void, !dbg !18
}

declare i32 @access(...) #1

; Function Attrs: nounwind uwtable
define i32 @svp_simple_668_001_main() #0 !dbg !19 {
  %1 = load i32, i32* @g1, align 4, !dbg !20, !tbaa !11
  %2 = call i32 (i32, ...) bitcast (i32 (...)* @assert_racefree to i32 (i32, ...)*)(i32 %1), !dbg !21
  %3 = load i32, i32* @g1, align 4, !dbg !22, !tbaa !11
  %4 = call i32 (i32, ...) bitcast (i32 (...)* @assert_racefree to i32 (i32, ...)*)(i32 %3), !dbg !23
  %5 = load i32, i32* @g2, align 4, !dbg !24, !tbaa !11
  %6 = call i32 (i32, ...) bitcast (i32 (...)* @assert_racefree to i32 (i32, ...)*)(i32 %5), !dbg !25
  %7 = load i32, i32* @g1, align 4, !dbg !26, !tbaa !11
  %8 = call i32 (i32, ...) bitcast (i32 (...)* @assert_racefree to i32 (i32, ...)*)(i32 %7), !dbg !27
  ret i32 0, !dbg !28
}

declare i32 @assert_racefree(...) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_668_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_668_001_isr_1", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_668_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 5, column: 10, scope: !7)
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !DILocation(line: 5, column: 3, scope: !7)
!16 = !DILocation(line: 7, column: 10, scope: !7)
!17 = !DILocation(line: 7, column: 3, scope: !7)
!18 = !DILocation(line: 9, column: 1, scope: !7)
!19 = distinct !DISubprogram(name: "svp_simple_668_001_main", scope: !8, file: !8, line: 11, type: !9, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!20 = !DILocation(line: 13, column: 19, scope: !19)
!21 = !DILocation(line: 13, column: 3, scope: !19)
!22 = !DILocation(line: 15, column: 19, scope: !19)
!23 = !DILocation(line: 15, column: 3, scope: !19)
!24 = !DILocation(line: 16, column: 19, scope: !19)
!25 = !DILocation(line: 16, column: 3, scope: !19)
!26 = !DILocation(line: 19, column: 19, scope: !19)
!27 = !DILocation(line: 19, column: 3, scope: !19)
!28 = !DILocation(line: 22, column: 3, scope: !19)
