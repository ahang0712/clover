; ModuleID = 'svp_simple_601_001-opt.bc'
source_filename = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_601_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = global i32 1, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_601_001_isr_1(i8* %0) #0 !dbg !7 {
  %2 = load i32, i32* @x, align 4, !dbg !9, !tbaa !10
  %3 = icmp eq i32 %2, 1, !dbg !14
  br i1 %3, label %4, label %5, !dbg !9

4:                                                ; preds = %1
  br label %5, !dbg !15

5:                                                ; preds = %4, %1
  store i32 -1, i32* @x, align 4, !dbg !16, !tbaa !10
  ret void, !dbg !17
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_601_001_main() #0 !dbg !18 {
  %1 = load i32, i32* @x, align 4, !dbg !19, !tbaa !10
  %2 = icmp eq i32 %1, 1, !dbg !20
  %3 = zext i1 %2 to i32, !dbg !20
  %4 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 %3), !dbg !21
  store i32 0, i32* @x, align 4, !dbg !22, !tbaa !10
  %5 = load i32, i32* @x, align 4, !dbg !23, !tbaa !10
  %6 = icmp eq i32 %5, 0, !dbg !24
  %7 = zext i1 %6 to i32, !dbg !24
  %8 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 %7), !dbg !25
  store i32 1, i32* @x, align 4, !dbg !26, !tbaa !10
  ret i32 0, !dbg !27
}

declare i32 @assert(...) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_601_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_601_001_isr_1", scope: !1, file: !1, line: 4, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 7, column: 7, scope: !7)
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !DILocation(line: 7, column: 9, scope: !7)
!15 = !DILocation(line: 9, column: 3, scope: !7)
!16 = !DILocation(line: 11, column: 5, scope: !7)
!17 = !DILocation(line: 12, column: 1, scope: !7)
!18 = distinct !DISubprogram(name: "svp_simple_601_001_main", scope: !1, file: !1, line: 14, type: !8, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!19 = !DILocation(line: 16, column: 10, scope: !18)
!20 = !DILocation(line: 16, column: 12, scope: !18)
!21 = !DILocation(line: 16, column: 3, scope: !18)
!22 = !DILocation(line: 18, column: 5, scope: !18)
!23 = !DILocation(line: 19, column: 10, scope: !18)
!24 = !DILocation(line: 19, column: 12, scope: !18)
!25 = !DILocation(line: 19, column: 3, scope: !18)
!26 = !DILocation(line: 20, column: 5, scope: !18)
!27 = !DILocation(line: 22, column: 3, scope: !18)
