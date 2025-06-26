; ModuleID = 'svp_simple_304_001-opt.bc'
source_filename = "./svp_simple_304_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@data = global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_304_001_isr_1(i8* %0) #0 !dbg !12 {
  %2 = load i32, i32* @data, align 4, !dbg !13, !tbaa !14
  %3 = add nsw i32 %2, 1, !dbg !18
  store i32 %3, i32* @data, align 4, !dbg !19, !tbaa !14
  ret void, !dbg !20
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_304_001_isr_2(i8* %0) #0 !dbg !21 {
  %2 = load i32, i32* @data, align 4, !dbg !22, !tbaa !14
  %3 = add nsw i32 %2, 2, !dbg !23
  store i32 %3, i32* @data, align 4, !dbg !24, !tbaa !14
  ret void, !dbg !25
}

; Function Attrs: nounwind uwtable
define void @svp_simple_304_001_isr_3(i8* %0) #0 !dbg !26 {
  %2 = load i32, i32* @data, align 4, !dbg !27, !tbaa !14
  %3 = icmp sge i32 %2, 3, !dbg !28
  br i1 %3, label %4, label %7, !dbg !27

4:                                                ; preds = %1
  br label %5, !dbg !29

5:                                                ; preds = %4
  %6 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !30
  call void @abort() #5, !dbg !32
  unreachable, !dbg !32

7:                                                ; preds = %1
  ret void, !dbg !33
}

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: nounwind uwtable
define i32 @svp_simple_304_001_main() #0 !dbg !34 {
  ret i32 0, !dbg !35
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_304_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_304_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 2, column: 22, scope: !7)
!11 = !DILocation(line: 2, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "svp_simple_304_001_isr_1", scope: !8, file: !8, line: 6, type: !9, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 8, column: 13, scope: !12)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 8, column: 18, scope: !12)
!19 = !DILocation(line: 9, column: 8, scope: !12)
!20 = !DILocation(line: 11, column: 1, scope: !12)
!21 = distinct !DISubprogram(name: "svp_simple_304_001_isr_2", scope: !8, file: !8, line: 14, type: !9, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!22 = !DILocation(line: 16, column: 13, scope: !21)
!23 = !DILocation(line: 16, column: 18, scope: !21)
!24 = !DILocation(line: 17, column: 8, scope: !21)
!25 = !DILocation(line: 18, column: 1, scope: !21)
!26 = distinct !DISubprogram(name: "svp_simple_304_001_isr_3", scope: !8, file: !8, line: 21, type: !9, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!27 = !DILocation(line: 23, column: 7, scope: !26)
!28 = !DILocation(line: 23, column: 12, scope: !26)
!29 = !DILocation(line: 23, column: 17, scope: !26)
!30 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !31)
!31 = distinct !DILocation(line: 24, column: 13, scope: !26)
!32 = !DILocation(line: 24, column: 27, scope: !26)
!33 = !DILocation(line: 26, column: 1, scope: !26)
!34 = distinct !DISubprogram(name: "svp_simple_304_001_main", scope: !8, file: !8, line: 29, type: !9, scopeLine: 30, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 31, column: 3, scope: !34)
